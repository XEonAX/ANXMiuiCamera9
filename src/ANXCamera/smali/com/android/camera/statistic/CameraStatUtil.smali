.class public Lcom/android/camera/statistic/CameraStatUtil;
.super Ljava/lang/Object;
.source "CameraStatUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sBeautyTypeToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sCameraModeIdToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sExposureTimeLessThan1sToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sFilterTypeToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sPictureQualityIndexToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sTriggerModeIdToName:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 47
    const-class v0, Lcom/android/camera/statistic/CameraStatUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    .line 56
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    .line 59
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u5c0f\u89c6\u9891"

    const/16 v2, 0xa1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 60
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u62cd\u7167"

    const/16 v2, 0xa3

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 61
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u65b9\u5f62"

    const/16 v2, 0xa5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 62
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u5168\u666f"

    const/16 v2, 0xa6

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 63
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u624b\u52a8"

    const/16 v2, 0xa7

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 64
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u4eba\u50cf"

    const/16 v2, 0xab

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 67
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    .line 70
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u62cd\u7167\u952e"

    const/16 v2, 0xa

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 71
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u97f3\u91cf\u952e"

    const/16 v2, 0x14

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 72
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u6307\u7eb9"

    const/16 v2, 0x1e

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 73
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u76f8\u673a\u952e"

    const/16 v2, 0x28

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "dpad\u952e"

    const/16 v2, 0x32

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 75
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u7269\u4f53\u8ffd\u8e2a"

    const/16 v2, 0x3c

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 76
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u58f0\u63a7\u5feb\u95e8"

    const/16 v2, 0x46

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 77
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u957f\u6309\u5c4f\u5e55"

    const/16 v2, 0x50

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 78
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u66dd\u5149\u73af"

    const/16 v2, 0x5a

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 84
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    .line 87
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u6700\u4f4e"

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 88
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u66f4\u4f4e"

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 89
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u4f4e"

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 90
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u6807\u51c6"

    const/4 v2, 0x3

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 91
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u9ad8"

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 92
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u66f4\u9ad8"

    const/4 v2, 0x5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 93
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "\u6700\u9ad8"

    const/4 v2, 0x6

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 96
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    .line 99
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "auto"

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 100
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/1000s"

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 101
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/500s"

    const/16 v2, 0x7d0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 102
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/250s"

    const/16 v2, 0xfa0

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 103
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/250s"

    const/16 v2, 0x1388

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 104
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/125s"

    const/16 v2, 0x1f40

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 105
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/60s"

    const/16 v2, 0x411b

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 106
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/30s"

    const v2, 0x8235

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 107
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/15s"

    const v2, 0x1046b

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 108
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/8s"

    const v2, 0x1e848

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 109
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/4s"

    const v2, 0x3d090

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 110
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1/2s"

    const v2, 0x7a120

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 111
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "1s"

    const v2, 0xf4240

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 112
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "2s"

    const v2, 0x1e8480

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 113
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "4s"

    const v2, 0x3d0900

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 114
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "8s"

    const v2, 0x7a1200

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 115
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "16s"

    const v2, 0xf42400

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 116
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    const-string/jumbo v1, "32s"

    const v2, 0x1e84800

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 119
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    .line 122
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->WHITEN_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7f8e\u767d"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 123
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SHRINK_FACE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7626\u8138"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 124
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->ENLARGE_EYE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5927\u773c"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 125
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMOOTH_STRENGTH:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5ae9\u80a4"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 127
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u82ad\u6bd4\u9f3b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 128
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->RISORIUS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u82f9\u679c\u808c"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 129
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->LIPS_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u82b1\u74e3\u5507"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 130
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->CHIN_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7fd8\u4e0b\u5df4"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 131
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->NECK_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5929\u9e45\u9888"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 133
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SMILE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5fae\u7b11"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 134
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/effect/BeautyParameters$Type;->SLIM_NOSE_RATIO:Lcom/android/camera/effect/BeautyParameters$Type;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7626\u9f3b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 137
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    .line 140
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_BERRY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u6d46\u679c"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 141
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_COOKIE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u66f2\u5947"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 142
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_DELICACY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7f8e\u5473"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 143
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FADE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u892a\u8272"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 144
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u80f6\u7247(\u62cd\u7167)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 145
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_KOIZORA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u604b\u7a7a"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 146
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LATTE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u62ff\u94c1"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 147
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIGHT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u6d6e\u5149"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 148
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_LIVELY:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u751f\u52a8"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 149
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_QUIET:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u9759\u8c27"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 150
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_SODA:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u6c7d\u6c34"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 151
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WARM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u6696\u9633"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 152
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_FAIRYTALE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7ae5\u8bdd"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 153
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_JAPANESE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u65e5\u7cfb"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 154
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MINT:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u8584\u8377"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 155
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MOOD:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5fc3\u5883"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 156
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_NATURE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u81ea\u7136"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 157
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_PINK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u7c89\u5ae9"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 158
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_ROMANCE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u6d6a\u6f2b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 159
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_MAZE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u8ff7\u5bab"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 160
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->B_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u9ed1\u767d(\u4eba\u50cf)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 161
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FILM:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u80f6\u7247(\u5f55\u50cf)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 162
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_YEARS:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u90a3\u4e9b\u5e74"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 163
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_POLAROID:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u62cd\u7acb\u5f97"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 164
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_FOREST:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5c0f\u68ee\u6797"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 165
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_BYGONE:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u5f80\u4e8b"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 166
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->S_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u9ed1\u767d(\u5f55\u50cf)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 167
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    sget-object v1, Lcom/miui/filtersdk/filter/helper/FilterType;->N_WHITEANDBLACK:Lcom/miui/filtersdk/filter/helper/FilterType;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string/jumbo v2, "\u9ed1\u767d(\u62cd\u7167)"

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 499
    if-eqz p0, :cond_1

    .line 500
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "front"

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 501
    .local v0, "sb":Ljava/lang/String;
    return-object v0

    .line 500
    .end local v0    # "sb":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, "back"

    goto :goto_0

    .line 504
    :cond_1
    return-object p0
.end method

.method private static antiBandingToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "antiBanding"    # Ljava/lang/String;

    .prologue
    .line 412
    if-nez p0, :cond_0

    .line 413
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "null antiBanding"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    const-string/jumbo v0, "others"

    return-object v0

    .line 416
    :cond_0
    const-string/jumbo v0, "0"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 418
    const-string/jumbo v0, "off"

    return-object v0

    .line 416
    :cond_1
    const-string/jumbo v0, "1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 420
    const-string/jumbo v0, "50hz"

    return-object v0

    .line 416
    :cond_2
    const-string/jumbo v0, "2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 422
    const-string/jumbo v0, "60hz"

    return-object v0

    .line 416
    :cond_3
    const-string/jumbo v0, "3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 424
    const-string/jumbo v0, "auto"

    return-object v0

    .line 426
    :cond_4
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unexpected antiBanding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    const-string/jumbo v0, "others"

    return-object v0
.end method

.method private static autoExposureToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "autoExposure"    # Ljava/lang/String;

    .prologue
    .line 268
    if-eqz p0, :cond_2

    .line 269
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 271
    .local v0, "res":Landroid/content/res/Resources;
    const v1, 0x7f0f00ed

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 270
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 272
    const-string/jumbo v1, "\u5e73\u5747\u6d4b\u5149"

    return-object v1

    .line 274
    :cond_0
    const v1, 0x7f0f00ee

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 273
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 275
    const-string/jumbo v1, "\u4e2d\u5fc3\u6743\u91cd"

    return-object v1

    .line 277
    :cond_1
    const v1, 0x7f0f00ef

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 276
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 278
    const-string/jumbo v1, "\u4e2d\u70b9\u6d4b\u5149"

    return-object v1

    .line 282
    .end local v0    # "res":Landroid/content/res/Resources;
    :cond_2
    sget-object v1, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unexpected auto exposure "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    const-string/jumbo v1, "others"

    return-object v1
.end method

.method private static autoWhiteBalanceToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "awb"    # Ljava/lang/String;

    .prologue
    .line 287
    if-nez p0, :cond_0

    .line 288
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "null awb"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    const-string/jumbo v0, "others"

    return-object v0

    .line 291
    :cond_0
    const-string/jumbo v0, "manual"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 293
    return-object p0

    .line 291
    :cond_1
    const-string/jumbo v0, "1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 295
    const-string/jumbo v0, "auto"

    return-object v0

    .line 291
    :cond_2
    const-string/jumbo v0, "2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 297
    const-string/jumbo v0, "incandescent"

    return-object v0

    .line 291
    :cond_3
    const-string/jumbo v0, "3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 299
    const-string/jumbo v0, "fluorescent"

    return-object v0

    .line 291
    :cond_4
    const-string/jumbo v0, "5"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 301
    const-string/jumbo v0, "daylight"

    return-object v0

    .line 291
    :cond_5
    const-string/jumbo v0, "6"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 303
    const-string/jumbo v0, "cloudy-daylight"

    return-object v0

    .line 305
    :cond_6
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unexpected awb "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    const-string/jumbo v0, "others"

    return-object v0
.end method

.method private static burstShotNumToName(I)Ljava/lang/String;
    .locals 1
    .param p0, "num"    # I

    .prologue
    .line 238
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static cameraIdToName(Z)Ljava/lang/String;
    .locals 1
    .param p0, "isFrontCamera"    # Z

    .prologue
    .line 202
    if-eqz p0, :cond_0

    const-string/jumbo v0, "\u524d\u6444"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "\u540e\u6444"

    goto :goto_0
.end method

.method private static contrastToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "contrast"    # Ljava/lang/String;

    .prologue
    .line 400
    const v0, 0x7f0b0013

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStatUtil;->pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static divideTo10Section(I)Ljava/lang/String;
    .locals 2
    .param p0, "num"    # I

    .prologue
    .line 242
    if-lez p0, :cond_0

    add-int/lit8 v1, p0, -0x1

    div-int/lit8 v0, v1, 0xa

    .line 243
    .local v0, "level":I
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 263
    const-string/jumbo v1, "90+"

    return-object v1

    .line 242
    .end local v0    # "level":I
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "level":I
    goto :goto_0

    .line 245
    :pswitch_0
    const-string/jumbo v1, "1+"

    return-object v1

    .line 247
    :pswitch_1
    const-string/jumbo v1, "10+"

    return-object v1

    .line 249
    :pswitch_2
    const-string/jumbo v1, "20+"

    return-object v1

    .line 251
    :pswitch_3
    const-string/jumbo v1, "30+"

    return-object v1

    .line 253
    :pswitch_4
    const-string/jumbo v1, "40+"

    return-object v1

    .line 255
    :pswitch_5
    const-string/jumbo v1, "50+"

    return-object v1

    .line 257
    :pswitch_6
    const-string/jumbo v1, "60+"

    return-object v1

    .line 259
    :pswitch_7
    const-string/jumbo v1, "70+"

    return-object v1

    .line 261
    :pswitch_8
    const-string/jumbo v1, "80+"

    return-object v1

    .line 243
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private static exposureTimeToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "exposure"    # Ljava/lang/String;

    .prologue
    const v8, 0xf4240

    .line 311
    if-eqz p0, :cond_1

    .line 313
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    long-to-int v1, v4

    .line 314
    .local v1, "exposureInt":I
    if-ge v1, v8, :cond_0

    .line 315
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->sExposureTimeLessThan1sToName:Landroid/util/SparseArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 316
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 317
    return-object v2

    .line 320
    .end local v2    # "name":Ljava/lang/String;
    :cond_0
    const v4, 0xf4240

    div-int v3, v1, v4

    .line 321
    .local v3, "seconds":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "s"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    return-object v4

    .line 323
    .end local v1    # "exposureInt":I
    .end local v3    # "seconds":I
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "invalid exposure time "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "unexpected exposure time "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    const-string/jumbo v4, "auto"

    return-object v4
.end method

.method public static faceBeautyRatioToName(I)Ljava/lang/String;
    .locals 1
    .param p0, "ratio"    # I

    .prologue
    .line 231
    if-nez p0, :cond_0

    .line 232
    const-string/jumbo v0, "0"

    return-object v0

    .line 234
    :cond_0
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static filterIdToName(I)Ljava/lang/String;
    .locals 6
    .param p0, "filterId"    # I

    .prologue
    .line 171
    sget v3, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v3, p0, :cond_0

    .line 172
    const-string/jumbo v3, "none"

    return-object v3

    .line 175
    :cond_0
    invoke-static {p0}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v0

    .line 176
    .local v0, "category":I
    packed-switch v0, :pswitch_data_0

    .line 189
    :cond_1
    sget-object v3, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "unexpected filter id: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    const-string/jumbo v3, "none"

    return-object v3

    .line 180
    :pswitch_0
    invoke-static {p0}, Lcom/android/camera/effect/FilterInfo;->getIndex(I)I

    move-result v1

    .line 181
    .local v1, "index":I
    sget-object v3, Lcom/android/camera/statistic/CameraStatUtil;->sFilterTypeToName:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 182
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 183
    return-object v2

    .line 176
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static flashModeToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "flashMode"    # Ljava/lang/String;

    .prologue
    .line 475
    if-nez p0, :cond_0

    .line 476
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "null flash mode"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    const-string/jumbo v0, "others"

    return-object v0

    .line 479
    :cond_0
    const-string/jumbo v0, "3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 481
    const-string/jumbo v0, "auto"

    return-object v0

    .line 479
    :cond_1
    const-string/jumbo v0, "1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 483
    const-string/jumbo v0, "on"

    return-object v0

    .line 479
    :cond_2
    const-string/jumbo v0, "103"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 485
    const-string/jumbo v0, "screen-light-auto"

    return-object v0

    .line 479
    :cond_3
    const-string/jumbo v0, "101"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 487
    const-string/jumbo v0, "screen-light-on"

    return-object v0

    .line 479
    :cond_4
    const-string/jumbo v0, "2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 489
    const-string/jumbo v0, "torch"

    return-object v0

    .line 479
    :cond_5
    const-string/jumbo v0, "0"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 491
    const-string/jumbo v0, "off"

    return-object v0

    .line 493
    :cond_6
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unexpected flash mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    const-string/jumbo v0, "others"

    return-object v0
.end method

.method private static focusPositionToName(I)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # I

    .prologue
    .line 357
    const/16 v1, 0x3e8

    if-ne v1, p0, :cond_0

    .line 358
    const-string/jumbo v1, "auto"

    return-object v1

    .line 360
    :cond_0
    rsub-int v1, p0, 0x3e8

    div-int/lit8 v0, v1, 0xa

    .line 361
    .local v0, "num":I
    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->divideTo10Section(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getDualZoomName(I)Ljava/lang/String;
    .locals 3
    .param p0, "cameraMode"    # I

    .prologue
    .line 370
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v2

    if-nez v2, :cond_0

    .line 371
    const-string/jumbo v2, "none"

    return-object v2

    .line 374
    :cond_0
    packed-switch p0, :pswitch_data_0

    .line 385
    :pswitch_0
    const-string/jumbo v2, "none"

    return-object v2

    .line 377
    :pswitch_1
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, "zoomMode":Ljava/lang/String;
    const-string/jumbo v2, "tele"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 379
    const-string/jumbo v2, "2x"

    .line 378
    :goto_0
    return-object v2

    .line 379
    :cond_1
    const-string/jumbo v2, "1x"

    goto :goto_0

    .line 382
    .end local v0    # "zoomMode":Ljava/lang/String;
    :pswitch_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->readZoom()F

    move-result v1

    .line 383
    .local v1, "zoomRatio":F
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->zoomRatioToName(F)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 374
    nop

    :pswitch_data_0
    .packed-switch 0xa3
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private static indexOfString([Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "list"    # [Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 463
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 464
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 465
    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    return v0

    .line 464
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 471
    .end local v0    # "i":I
    :cond_1
    const/4 v1, -0x1

    return v1
.end method

.method private static isoToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "iso"    # Ljava/lang/String;

    .prologue
    .line 341
    if-eqz p0, :cond_1

    .line 342
    const-string/jumbo v2, "auto"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 343
    const-string/jumbo v2, "auto"

    return-object v2

    .line 345
    :cond_0
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 346
    .local v1, "upperIso":Ljava/lang/String;
    const-string/jumbo v2, "ISO"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 347
    .local v0, "index":I
    const/4 v2, -0x1

    if-le v0, v2, :cond_1

    .line 348
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 353
    .end local v0    # "index":I
    .end local v1    # "upperIso":Ljava/lang/String;
    :cond_1
    return-object p0
.end method

.method public static modeIdToName(I)Ljava/lang/String;
    .locals 2
    .param p0, "modeId"    # I

    .prologue
    .line 194
    sget-object v1, Lcom/android/camera/statistic/CameraStatUtil;->sCameraModeIdToName:Landroid/util/SparseArray;

    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 195
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 196
    const-string/jumbo v0, "\u5f55\u50cf"

    .line 198
    :cond_0
    return-object v0
.end method

.method private static pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "arrayResId"    # I
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 447
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 448
    .local v3, "values":[Ljava/lang/String;
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    array-length v5, v3

    if-ge v4, v5, :cond_0

    .line 449
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "picture quality array size is smaller than values size "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 452
    :cond_0
    invoke-static {v3, p1}, Lcom/android/camera/statistic/CameraStatUtil;->indexOfString([Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 453
    .local v1, "index":I
    const/4 v4, -0x1

    if-le v1, v4, :cond_1

    .line 454
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    array-length v5, v3

    sub-int/2addr v4, v5

    div-int/lit8 v0, v4, 0x2

    .line 455
    .local v0, "delta":I
    add-int v2, v1, v0

    .line 456
    .local v2, "normalIndex":I
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->sPictureQualityIndexToName:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    return-object v4

    .line 459
    .end local v0    # "delta":I
    .end local v2    # "normalIndex":I
    :cond_1
    const-string/jumbo v4, "others"

    return-object v4
.end method

.method private static round(JI)J
    .locals 4
    .param p0, "value"    # J
    .param p2, "base"    # I

    .prologue
    .line 564
    if-gtz p2, :cond_0

    .line 565
    return-wide p0

    .line 567
    :cond_0
    div-int/lit8 v0, p2, 0x2

    int-to-long v0, v0

    add-long/2addr v0, p0

    int-to-long v2, p2

    div-long/2addr v0, v2

    int-to-long v2, p2

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private static saturationToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "saturation"    # Ljava/lang/String;

    .prologue
    .line 404
    const v0, 0x7f0b0015

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStatUtil;->pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static sharpnessToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "sharpness"    # Ljava/lang/String;

    .prologue
    .line 408
    const v0, 0x7f0b0017

    invoke-static {v0, p0}, Lcom/android/camera/statistic/CameraStatUtil;->pictureQualityToName(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static timeLapseIntervalToName(I)Ljava/lang/String;
    .locals 6
    .param p0, "interval"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v5, 0x0

    .line 531
    const/16 v0, 0x3e8

    if-ge p0, v0, :cond_0

    .line 532
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v1, "%.2fs"

    new-array v2, v2, [Ljava/lang/Object;

    int-to-float v3, p0

    const/high16 v4, 0x447a0000    # 1000.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 534
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string/jumbo v1, "%ds"

    new-array v2, v2, [Ljava/lang/Object;

    div-int/lit16 v3, p0, 0x3e8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p0, "category"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "keyValues"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 539
    array-length v3, p2

    rem-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-static {v2}, Lcom/android/camera/Util;->Assert(Z)V

    .line 540
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 541
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p2

    if-ge v0, v2, :cond_1

    .line 542
    aget-object v2, p2, v0

    add-int/lit8 v3, v0, 0x1

    aget-object v3, p2, v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 544
    :cond_1
    invoke-static {p0, p1, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 545
    return-void
.end method

.method public static trackAISceneChanged(IILandroid/content/res/Resources;)V
    .locals 5
    .param p0, "cameraMode"    # I
    .param p1, "scene"    # I
    .param p2, "resource"    # Landroid/content/res/Resources;

    .prologue
    .line 942
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 943
    return-void

    .line 945
    :cond_0
    const-string/jumbo v1, "\u672a\u77e5"

    .line 946
    .local v1, "sceneNameStr":Ljava/lang/String;
    const/high16 v3, 0x7f0b0000

    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 947
    .local v2, "sceneNames":Landroid/content/res/TypedArray;
    if-ltz p1, :cond_1

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->length()I

    move-result v3

    if-ge p1, v3, :cond_1

    .line 948
    invoke-virtual {v2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 950
    :cond_1
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 952
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 953
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v3, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 954
    const-string/jumbo v3, "\u667a\u80fd\u573a\u666f\u53d1\u73b0"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 955
    const-string/jumbo v3, "counter"

    const-string/jumbo v4, "ai_scene_changed"

    invoke-static {v3, v4, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 956
    return-void
.end method

.method public static trackAwbChanged(Ljava/lang/String;)V
    .locals 3
    .param p0, "awb"    # Ljava/lang/String;

    .prologue
    .line 993
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 994
    return-void

    .line 996
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 997
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u767d\u5e73\u8861"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->autoWhiteBalanceToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 999
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "manual_awb_changed"

    .line 998
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1000
    return-void
.end method

.method public static trackBeautyInfo(ILjava/lang/String;Lcom/android/camera/effect/BeautyValues;)V
    .locals 9
    .param p0, "takenNum"    # I
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "beautyValues"    # Lcom/android/camera/effect/BeautyValues;

    .prologue
    .line 1060
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1061
    .local v2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v4, "\u524d\u540e\u6444"

    invoke-interface {v2, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1063
    invoke-static {}, Lcom/android/camera/Device;->isSupportNewFaceBeauty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1064
    invoke-static {}, Lcom/android/camera/effect/BeautyParameters;->getInstance()Lcom/android/camera/effect/BeautyParameters;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/effect/BeautyParameters;->getAdjustableTypes()[Lcom/android/camera/effect/BeautyParameters$Type;

    move-result-object v5

    const/4 v4, 0x0

    array-length v6, v5

    :goto_0
    if-ge v4, v6, :cond_2

    aget-object v3, v5, v4

    .line 1065
    .local v3, "type":Lcom/android/camera/effect/BeautyParameters$Type;
    sget-object v7, Lcom/android/camera/statistic/CameraStatUtil;->sBeautyTypeToName:Landroid/util/SparseArray;

    invoke-virtual {v3}, Lcom/android/camera/effect/BeautyParameters$Type;->ordinal()I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1066
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1067
    invoke-virtual {p2, v3}, Lcom/android/camera/effect/BeautyValues;->get(Lcom/android/camera/effect/BeautyParameters$Type;)I

    move-result v7

    invoke-static {v7}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1064
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1071
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "type":Lcom/android/camera/effect/BeautyParameters$Type;
    :cond_1
    const-string/jumbo v4, "\u7626\u8138"

    .line 1072
    iget v5, p2, Lcom/android/camera/effect/BeautyValues;->mBeautySlimFace:I

    invoke-static {v5}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v5

    .line 1071
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1073
    const-string/jumbo v4, "\u5927\u773c"

    .line 1074
    iget v5, p2, Lcom/android/camera/effect/BeautyValues;->mBeautyEnlargeEye:I

    invoke-static {v5}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v5

    .line 1073
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1075
    const-string/jumbo v4, "\u7f8e\u767d"

    .line 1076
    iget v5, p2, Lcom/android/camera/effect/BeautyValues;->mBeautySkinColor:I

    invoke-static {v5}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v5

    .line 1075
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    const-string/jumbo v4, "\u5ae9\u80a4"

    .line 1078
    iget v5, p2, Lcom/android/camera/effect/BeautyValues;->mBeautySkinSmooth:I

    invoke-static {v5}, Lcom/android/camera/statistic/CameraStatUtil;->faceBeautyRatioToName(I)Ljava/lang/String;

    move-result-object v5

    .line 1077
    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1081
    :cond_2
    invoke-static {}, Lcom/android/camera/Device;->isLegacyFaceBeauty()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1082
    const-string/jumbo v5, "\u7b49\u7ea7"

    .line 1083
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAdvancedBeautyOn()Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v4, "advanced"

    .line 1082
    :goto_1
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1085
    const-string/jumbo v4, "capture"

    .line 1086
    const-string/jumbo v5, "picture_taken_beauty_legacy"

    int-to-long v6, p0

    .line 1085
    invoke-static {v4, v5, v6, v7, v2}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1093
    :goto_2
    return-void

    .line 1084
    :cond_3
    iget-object v4, p2, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 1088
    :cond_4
    iget-object v4, p2, Lcom/android/camera/effect/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result v0

    .line 1089
    .local v0, "level":I
    const-string/jumbo v4, "\u7b49\u7ea7"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1090
    const-string/jumbo v4, "capture"

    .line 1091
    const-string/jumbo v5, "picture_taken_beauty"

    int-to-long v6, p0

    .line 1090
    invoke-static {v4, v5, v6, v7, v2}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    goto :goto_2
.end method

.method public static trackBokehChanged(ILjava/lang/String;)V
    .locals 3
    .param p0, "cameraMode"    # I
    .param p1, "bokeh"    # Ljava/lang/String;

    .prologue
    .line 856
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 857
    return-void

    .line 859
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 860
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 861
    const-string/jumbo v1, "BOKEH"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 862
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "bokeh_changed"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 863
    return-void
.end method

.method public static trackCameraError(Ljava/lang/String;)V
    .locals 3
    .param p0, "error"    # Ljava/lang/String;

    .prologue
    .line 508
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 509
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u524d\u540e\u6444"

    .line 510
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 511
    const-string/jumbo v1, "\u524d\u6444"

    .line 509
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    const-string/jumbo v1, "\u6a21\u5f0f"

    .line 513
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 512
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    const-string/jumbo v1, "error"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    const-string/jumbo v1, "counter"

    .line 516
    const-string/jumbo v2, "camera_hardware_error"

    .line 515
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 517
    return-void

    .line 511
    :cond_0
    const-string/jumbo v1, "\u540e\u6444"

    goto :goto_0
.end method

.method public static trackConfigChange(Ljava/lang/String;Ljava/lang/String;ZZZ)V
    .locals 4
    .param p0, "event"    # Ljava/lang/String;
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "on"    # Z
    .param p3, "trackCameraMode"    # Z
    .param p4, "trackCameraId"    # Z

    .prologue
    .line 867
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 868
    return-void

    .line 870
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 871
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p3, :cond_1

    .line 872
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 873
    .local v0, "mode":I
    const-string/jumbo v2, "\u6a21\u5f0f"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 875
    .end local v0    # "mode":I
    :cond_1
    if-eqz p4, :cond_2

    .line 876
    const-string/jumbo v3, "\u524d\u540e\u6444"

    .line 877
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 878
    const-string/jumbo v2, "\u524d\u6444"

    .line 876
    :goto_0
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 880
    :cond_2
    if-eqz p2, :cond_4

    const-string/jumbo v2, "on"

    :goto_1
    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    const-string/jumbo v2, "counter"

    invoke-static {v2, p0, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 882
    return-void

    .line 878
    :cond_3
    const-string/jumbo v2, "\u540e\u6444"

    goto :goto_0

    .line 880
    :cond_4
    const-string/jumbo v2, "off"

    goto :goto_1
.end method

.method public static trackDirectionChanged(I)V
    .locals 3
    .param p0, "direction"    # I

    .prologue
    .line 970
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 971
    return-void

    .line 973
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 974
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u65b9\u5411"

    .line 975
    const/4 v1, 0x4

    if-ne v1, p0, :cond_1

    .line 976
    const-string/jumbo v1, "\u4ece\u5de6\u5f80\u53f3"

    .line 974
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 978
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "panorama_direction_changed"

    .line 977
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 979
    return-void

    .line 976
    :cond_1
    const-string/jumbo v1, "\u4ece\u53f3\u5f80\u5de6"

    goto :goto_0
.end method

.method public static trackDualWaterMarkChanged(Z)V
    .locals 3
    .param p0, "on"    # Z

    .prologue
    .line 885
    const-string/jumbo v1, "settings"

    .line 886
    const-string/jumbo v2, "pref_dualcamera_watermark"

    .line 887
    if-eqz p0, :cond_0

    const-string/jumbo v0, "on"

    .line 885
    :goto_0
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    return-void

    .line 887
    :cond_0
    const-string/jumbo v0, "off"

    goto :goto_0
.end method

.method public static trackDualZoomChanged(ILjava/lang/String;)V
    .locals 3
    .param p0, "cameraMode"    # I
    .param p1, "zoom"    # Ljava/lang/String;

    .prologue
    .line 812
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 813
    return-void

    .line 815
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 816
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 817
    const-string/jumbo v1, "\u53d8\u7126"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 819
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "dual_zoom_changed"

    .line 818
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 820
    return-void
.end method

.method public static trackEvAdjusted()V
    .locals 3

    .prologue
    .line 788
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 789
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u524d\u540e\u6444"

    .line 790
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 791
    const-string/jumbo v1, "\u524d\u6444"

    .line 789
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 792
    const-string/jumbo v1, "\u6a21\u5f0f"

    .line 793
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 792
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 794
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "ev_adjusted"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 795
    return-void

    .line 791
    :cond_0
    const-string/jumbo v1, "\u540e\u6444"

    goto :goto_0
.end method

.method public static trackExposureTimeChanged(Ljava/lang/String;)V
    .locals 3
    .param p0, "exposureTime"    # Ljava/lang/String;

    .prologue
    .line 1003
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1004
    return-void

    .line 1006
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1007
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u5feb\u95e8"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->exposureTimeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "manual_exposure_time_changed"

    .line 1008
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1010
    return-void
.end method

.method public static trackFilterChanged(IIZ)V
    .locals 3
    .param p0, "moduleIndex"    # I
    .param p1, "filterId"    # I
    .param p2, "fromClick"    # Z

    .prologue
    .line 823
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 824
    return-void

    .line 826
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 827
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    const-string/jumbo v1, "\u6ee4\u955c"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->filterIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 829
    const-string/jumbo v2, "\u65b9\u5f0f"

    .line 830
    if-eqz p2, :cond_1

    const-string/jumbo v1, "\u70b9\u51fb"

    .line 829
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 831
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "filter_changed"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 832
    return-void

    .line 830
    :cond_1
    const-string/jumbo v1, "\u6ed1\u52a8"

    goto :goto_0
.end method

.method public static trackFlashChanged(ILjava/lang/String;)V
    .locals 3
    .param p0, "cameraMode"    # I
    .param p1, "flash"    # Ljava/lang/String;

    .prologue
    .line 835
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 836
    return-void

    .line 838
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 839
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    const-string/jumbo v1, "\u95ea\u5149\u706f"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    const-string/jumbo v1, "counter"

    .line 842
    const-string/jumbo v2, "flash_changed"

    .line 841
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 843
    return-void
.end method

.method public static trackFocusPositionChanged(I)V
    .locals 3
    .param p0, "focusPosition"    # I

    .prologue
    .line 959
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 960
    return-void

    .line 962
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 963
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u5bf9\u7126"

    .line 964
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->focusPositionToName(I)Ljava/lang/String;

    move-result-object v2

    .line 963
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 965
    const-string/jumbo v1, "counter"

    .line 966
    const-string/jumbo v2, "manual_focus_position_changed"

    .line 965
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 967
    return-void
.end method

.method public static trackGeneralInfo(IZIIZLcom/android/camera/MutexModeManager;Ljava/lang/String;)V
    .locals 18
    .param p0, "takenNum"    # I
    .param p1, "isBurst"    # Z
    .param p2, "moduleIndex"    # I
    .param p3, "triggerMode"    # I
    .param p4, "isFrontCamera"    # Z
    .param p5, "mutexModeManager"    # Lcom/android/camera/MutexModeManager;
    .param p6, "flashAutoModeState"    # Ljava/lang/String;

    .prologue
    .line 614
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v5

    .line 615
    .local v5, "dataRunning":Lcom/android/camera/data/data/runing/DataItemRunning;
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    .line 616
    .local v4, "dataConfig":Lcom/android/camera/data/data/config/DataItemConfig;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 617
    .local v11, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move/from16 v2, p2

    .line 618
    .local v2, "cameraMode":I
    const-string/jumbo v14, "\u6a21\u5f0f"

    invoke-static/range {p2 .. p2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v11, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    const-string/jumbo v15, "\u5408\u5f71\u4f18\u9009"

    .line 620
    if-nez p1, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v14

    if-eqz v14, :cond_2

    const-string/jumbo v14, "on"

    .line 619
    :goto_0
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    const-string/jumbo v14, "\u89e6\u53d1\u65b9\u5f0f"

    invoke-static/range {p3 .. p3}, Lcom/android/camera/statistic/CameraStatUtil;->triggerModeToName(I)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v11, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 623
    const-string/jumbo v13, "0"

    .line 624
    .local v13, "timerValue":Ljava/lang/String;
    if-nez p1, :cond_0

    .line 625
    invoke-virtual {v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v12

    .line 626
    .local v12, "timerConfig":Lcom/android/camera/data/data/runing/ComponentRunningTimer;
    if-eqz v12, :cond_0

    .line 627
    move/from16 v0, p2

    invoke-virtual {v12, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getComponentValue(I)Ljava/lang/String;

    move-result-object v13

    .line 630
    .end local v12    # "timerConfig":Lcom/android/camera/data/data/runing/ComponentRunningTimer;
    :cond_0
    const-string/jumbo v14, "\u5012\u8ba1\u65f6"

    invoke-interface {v11, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 632
    const-string/jumbo v7, "0"

    .line 633
    .local v7, "flashMode":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v3

    .line 634
    .local v3, "configFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    if-eqz v3, :cond_1

    .line 635
    move/from16 v0, p2

    invoke-virtual {v3, v0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v7

    .line 636
    if-eqz p1, :cond_1

    const-string/jumbo v14, "2"

    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    xor-int/lit8 v14, v14, 0x1

    if-eqz v14, :cond_1

    .line 637
    const-string/jumbo v7, "0"

    .line 640
    :cond_1
    if-eqz p6, :cond_3

    .line 641
    const-string/jumbo v14, "\u95ea\u5149\u706f"

    move-object/from16 v0, p6

    invoke-interface {v11, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 646
    :goto_1
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lcom/android/camera/effect/EffectController;->getEffect(Z)I

    move-result v6

    .line 647
    .local v6, "filterId":I
    const-string/jumbo v15, "\u6ee4\u955c"

    .line 648
    if-eqz p1, :cond_4

    const-string/jumbo v14, "none"

    .line 647
    :goto_2
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    if-eqz p4, :cond_7

    .line 650
    const-string/jumbo v15, "\u5e74\u9f84\u68c0\u6d4b"

    .line 651
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result v14

    if-eqz v14, :cond_5

    const-string/jumbo v14, "on"

    .line 650
    :goto_3
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    const-string/jumbo v15, "\u9b54\u955c"

    .line 653
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result v14

    if-eqz v14, :cond_6

    const-string/jumbo v14, "on"

    .line 652
    :goto_4
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    const-string/jumbo v14, "capture"

    .line 655
    const-string/jumbo v15, "front_camera_info"

    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v16, v0

    .line 654
    move-wide/from16 v0, v16

    invoke-static {v14, v15, v0, v1, v11}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 688
    :goto_5
    return-void

    .line 620
    .end local v3    # "configFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    .end local v6    # "filterId":I
    .end local v7    # "flashMode":Ljava/lang/String;
    .end local v13    # "timerValue":Ljava/lang/String;
    :cond_2
    const-string/jumbo v14, "off"

    goto/16 :goto_0

    .line 643
    .restart local v3    # "configFlash":Lcom/android/camera/data/data/config/ComponentConfigFlash;
    .restart local v7    # "flashMode":Ljava/lang/String;
    .restart local v13    # "timerValue":Ljava/lang/String;
    :cond_3
    const-string/jumbo v14, "\u95ea\u5149\u706f"

    invoke-static {v7}, Lcom/android/camera/statistic/CameraStatUtil;->flashModeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v11, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 648
    .restart local v6    # "filterId":I
    :cond_4
    invoke-static {v6}, Lcom/android/camera/statistic/CameraStatUtil;->filterIdToName(I)Ljava/lang/String;

    move-result-object v14

    goto :goto_2

    .line 651
    :cond_5
    const-string/jumbo v14, "off"

    goto :goto_3

    .line 653
    :cond_6
    const-string/jumbo v14, "off"

    goto :goto_4

    .line 657
    :cond_7
    const-string/jumbo v15, "\u79fb\u8f74"

    .line 658
    if-nez p1, :cond_9

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v14

    if-eqz v14, :cond_9

    .line 659
    invoke-virtual {v5}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v14

    move/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v14

    .line 657
    :goto_6
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    const-string/jumbo v15, "\u6c34\u5e73\u4eea"

    .line 662
    if-nez p1, :cond_a

    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v14

    if-eqz v14, :cond_a

    .line 663
    const-string/jumbo v14, "on"

    .line 661
    :goto_7
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    const-string/jumbo v15, "HHT"

    .line 665
    if-nez p1, :cond_b

    if-eqz p5, :cond_b

    invoke-virtual/range {p5 .. p5}, Lcom/android/camera/MutexModeManager;->isHandNight()Z

    move-result v14

    if-eqz v14, :cond_b

    .line 666
    const-string/jumbo v14, "on"

    .line 664
    :goto_8
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    const-string/jumbo v10, "off"

    .line 669
    .local v10, "hdrValue":Ljava/lang/String;
    if-nez p1, :cond_8

    if-eqz p5, :cond_8

    .line 670
    invoke-virtual/range {p5 .. p5}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v9

    .line 671
    .local v9, "hdrOn":Z
    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v8

    .line 672
    .local v8, "hdrConfig":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    if-eqz v8, :cond_d

    const-string/jumbo v14, "auto"

    .line 673
    move/from16 v0, p2

    invoke-virtual {v8, v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v15

    .line 672
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_d

    .line 674
    if-eqz v9, :cond_c

    const-string/jumbo v10, "auto-on"

    .line 679
    .end local v8    # "hdrConfig":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .end local v9    # "hdrOn":Z
    :cond_8
    :goto_9
    const-string/jumbo v14, "HDR"

    invoke-interface {v11, v14, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    const-string/jumbo v15, "\u8d85\u5206\u8fa8\u7387"

    .line 682
    if-nez p1, :cond_e

    if-eqz p5, :cond_e

    invoke-virtual/range {p5 .. p5}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result v14

    if-eqz v14, :cond_e

    .line 683
    const-string/jumbo v14, "on"

    .line 681
    :goto_a
    invoke-interface {v11, v15, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 684
    const-string/jumbo v14, "\u53d8\u7126"

    invoke-static/range {p2 .. p2}, Lcom/android/camera/statistic/CameraStatUtil;->getDualZoomName(I)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v11, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    const-string/jumbo v14, "capture"

    .line 686
    const-string/jumbo v15, "back_camera_info"

    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v16, v0

    .line 685
    move-wide/from16 v0, v16

    invoke-static {v14, v15, v0, v1, v11}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    goto/16 :goto_5

    .line 660
    .end local v10    # "hdrValue":Ljava/lang/String;
    :cond_9
    const-string/jumbo v14, "off"

    goto/16 :goto_6

    .line 663
    :cond_a
    const-string/jumbo v14, "off"

    goto :goto_7

    .line 666
    :cond_b
    const-string/jumbo v14, "off"

    goto :goto_8

    .line 674
    .restart local v8    # "hdrConfig":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .restart local v9    # "hdrOn":Z
    .restart local v10    # "hdrValue":Ljava/lang/String;
    :cond_c
    const-string/jumbo v10, "auto-off"

    goto :goto_9

    .line 675
    :cond_d
    if-eqz v9, :cond_8

    .line 676
    const-string/jumbo v10, "on"

    goto :goto_9

    .line 683
    .end local v8    # "hdrConfig":Lcom/android/camera/data/data/config/ComponentConfigHdr;
    .end local v9    # "hdrOn":Z
    :cond_e
    const-string/jumbo v14, "off"

    goto :goto_a
.end method

.method public static trackGotoGallery(I)V
    .locals 3
    .param p0, "moduleIndex"    # I

    .prologue
    .line 735
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 736
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    .line 737
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 736
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 738
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "goto_gallery"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 739
    return-void
.end method

.method public static trackGotoSettings(I)V
    .locals 3
    .param p0, "moduleIndex"    # I

    .prologue
    .line 728
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 729
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    .line 730
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 729
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 731
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "goto_settings"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 732
    return-void
.end method

.method public static trackHdrChanged(ILjava/lang/String;)V
    .locals 3
    .param p0, "cameraMode"    # I
    .param p1, "hdr"    # Ljava/lang/String;

    .prologue
    .line 846
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 847
    return-void

    .line 849
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 850
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 851
    const-string/jumbo v1, "HDR"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 852
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "hdr_changed"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 853
    return-void
.end method

.method public static trackIsoChanged(Ljava/lang/String;)V
    .locals 3
    .param p0, "iso"    # Ljava/lang/String;

    .prologue
    .line 1013
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1014
    return-void

    .line 1016
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1017
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u611f\u5149\u5ea6"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->isoToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1019
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "manual_iso_changed"

    .line 1018
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1020
    return-void
.end method

.method public static trackLensChanged(Ljava/lang/String;)V
    .locals 3
    .param p0, "lens"    # Ljava/lang/String;

    .prologue
    .line 1023
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1024
    return-void

    .line 1026
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1027
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u955c\u5934"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1029
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "manual_lens_changed"

    .line 1028
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1030
    return-void
.end method

.method public static trackOpenCameraFail(ILjava/lang/String;)V
    .locals 4
    .param p0, "cameraId"    # I
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 742
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 743
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u524d\u540e\u6444"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    const-string/jumbo v1, "reason"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 745
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "open_camera_fail"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 746
    return-void
.end method

.method public static trackPauseVideoRecording(Z)V
    .locals 3
    .param p0, "isFrontCamera"    # Z

    .prologue
    .line 756
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 757
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u524d\u540e\u6444"

    .line 758
    if-eqz p0, :cond_0

    const-string/jumbo v1, "\u524d\u6444"

    .line 757
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    const-string/jumbo v1, "capture"

    .line 760
    const-string/jumbo v2, "video_pause_recording"

    .line 759
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 761
    return-void

    .line 758
    :cond_0
    const-string/jumbo v1, "\u540e\u6444"

    goto :goto_0
.end method

.method public static trackPictureTaken(IZIZZ)V
    .locals 8
    .param p0, "takenNum"    # I
    .param p1, "burst"    # Z
    .param p2, "moduleIndex"    # I
    .param p3, "isFrontCamera"    # Z
    .param p4, "location"    # Z

    .prologue
    .line 695
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 696
    .local v2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move v1, p3

    .line 697
    .local v1, "frontCamera":Z
    const-string/jumbo v5, "\u524d\u540e\u6444"

    .line 698
    if-eqz p3, :cond_2

    const-string/jumbo v4, "\u524d\u6444"

    .line 697
    :goto_0
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    move v0, p2

    .line 700
    .local v0, "cameraMode":I
    const-string/jumbo v5, "\u753b\u5e45"

    .line 701
    const/16 v4, 0xa5

    if-ne v4, p2, :cond_3

    const-string/jumbo v4, "1x1"

    .line 700
    :goto_1
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    const-string/jumbo v4, "\u753b\u8d28"

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->getJpegQuality(Z)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    const-string/jumbo v5, "\u65f6\u95f4\u6c34\u5370"

    .line 704
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v4

    if-eqz v4, :cond_4

    const-string/jumbo v4, "on"

    .line 703
    :goto_2
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    const-string/jumbo v5, "\u53cc\u6444\u6c34\u5370"

    .line 706
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v4

    if-eqz v4, :cond_5

    const-string/jumbo v4, "on"

    .line 705
    :goto_3
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    const-string/jumbo v5, "\u5730\u7406\u4f4d\u7f6e"

    .line 708
    if-eqz p4, :cond_6

    const-string/jumbo v4, "\u6709"

    .line 707
    :goto_4
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    const-string/jumbo v4, "capture"

    .line 712
    const-string/jumbo v5, "picture_taken"

    int-to-long v6, p0

    .line 711
    invoke-static {v4, v5, v6, v7, v2}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 714
    if-eqz p1, :cond_1

    .line 715
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPressDownCapture()Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    if-le p0, v4, :cond_0

    .line 716
    add-int/lit8 p0, p0, -0x1

    .line 718
    :cond_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 719
    .local v3, "params2":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v4, "\u5f20\u6570"

    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->burstShotNumToName(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    const-string/jumbo v4, "capture"

    .line 721
    const-string/jumbo v5, "picture_taken_burst"

    int-to-long v6, p0

    .line 720
    invoke-static {v4, v5, v6, v7, v3}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 722
    const-string/jumbo v4, "capture"

    .line 723
    const-string/jumbo v5, "burst_shot_times"

    .line 722
    invoke-static {v4, v5, v3}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 725
    .end local v3    # "params2":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    return-void

    .line 698
    .end local v0    # "cameraMode":I
    :cond_2
    const-string/jumbo v4, "\u540e\u6444"

    goto/16 :goto_0

    .line 701
    .restart local v0    # "cameraMode":I
    :cond_3
    const-string/jumbo v4, "4x3"

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getPictureSize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 704
    :cond_4
    const-string/jumbo v4, "off"

    goto :goto_2

    .line 706
    :cond_5
    const-string/jumbo v4, "off"

    goto :goto_3

    .line 709
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 710
    const-string/jumbo v4, "\u65e0"

    goto :goto_4

    :cond_7
    const-string/jumbo v4, "\u5173"

    goto :goto_4
.end method

.method public static trackPictureTakenInManual(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .param p0, "takenNum"    # I
    .param p1, "whiteBalance"    # Ljava/lang/String;
    .param p2, "exposureTime"    # Ljava/lang/String;
    .param p3, "iso"    # Ljava/lang/String;
    .param p4, "module"    # I

    .prologue
    .line 1046
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1047
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u767d\u5e73\u8861"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->autoWhiteBalanceToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1048
    const-string/jumbo v1, "\u5bf9\u7126"

    .line 1049
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->focusPositionToName(I)Ljava/lang/String;

    move-result-object v2

    .line 1048
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1050
    const-string/jumbo v1, "\u5feb\u95e8"

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->exposureTimeToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1051
    const-string/jumbo v1, "\u611f\u5149\u5ea6"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->isoToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1052
    const-string/jumbo v1, "\u955c\u5934"

    invoke-static {p4}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1053
    const-string/jumbo v2, "\u5cf0\u503c\u5bf9\u7126"

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->isNeedDrawPeaking()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1054
    const-string/jumbo v1, "on"

    .line 1053
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1055
    const-string/jumbo v1, "capture"

    .line 1056
    const-string/jumbo v2, "picture_taken_manual"

    int-to-long v4, p0

    .line 1055
    invoke-static {v1, v2, v4, v5, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1057
    return-void

    .line 1054
    :cond_0
    const-string/jumbo v1, "off"

    goto :goto_0
.end method

.method public static trackPictureTakenInPanorama(I)V
    .locals 6
    .param p0, "takenNum"    # I

    .prologue
    .line 1033
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1034
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u65b9\u5411"

    .line 1035
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPanoramaMoveDirection()I

    move-result v1

    const/4 v3, 0x4

    if-ne v3, v1, :cond_0

    .line 1036
    const-string/jumbo v1, "\u4ece\u5de6\u5f80\u53f3"

    .line 1034
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1037
    const-string/jumbo v1, "capture"

    .line 1038
    const-string/jumbo v2, "picture_taken_panorama"

    int-to-long v4, p0

    .line 1037
    invoke-static {v1, v2, v4, v5, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 1039
    return-void

    .line 1036
    :cond_0
    const-string/jumbo v1, "\u4ece\u53f3\u5f80\u5de6"

    goto :goto_0
.end method

.method public static trackPocketModeEnter(Ljava/lang/String;)V
    .locals 5
    .param p0, "event"    # Ljava/lang/String;

    .prologue
    .line 798
    const-string/jumbo v0, "counter"

    .line 799
    const-string/jumbo v1, "pocket_mode_enter"

    .line 798
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    .line 799
    const-string/jumbo v3, "\u65b9\u5f0f"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p0, v2, v3

    .line 798
    invoke-static {v0, v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 800
    return-void
.end method

.method public static trackPocketModeExit(Ljava/lang/String;)V
    .locals 5
    .param p0, "event"    # Ljava/lang/String;

    .prologue
    .line 803
    const-string/jumbo v0, "counter"

    .line 804
    const-string/jumbo v1, "pocket_mode_keyguard_exit"

    .line 803
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    .line 804
    const-string/jumbo v3, "\u65b9\u5f0f"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p0, v2, v3

    .line 803
    invoke-static {v0, v1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 805
    return-void
.end method

.method public static trackPocketModeSensorDelay()V
    .locals 2

    .prologue
    .line 808
    const-string/jumbo v0, "counter"

    const-string/jumbo v1, "pocket_mode_sensor_delay"

    invoke-static {v0, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    return-void
.end method

.method public static trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1123
    if-nez p0, :cond_0

    .line 1124
    return-void

    .line 1127
    :cond_0
    instance-of v3, p1, Ljava/lang/Boolean;

    if-eqz v3, :cond_3

    .line 1128
    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string/jumbo v2, "on"

    .line 1133
    .local v2, "newValue":Ljava/lang/String;
    :goto_0
    const-string/jumbo v3, "pref_video_quality_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1135
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1136
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->videoQualityToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1171
    :cond_1
    :goto_1
    const-string/jumbo v3, "settings"

    invoke-static {v3, p0, v2}, Lcom/android/camera/statistic/CameraStat;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1172
    return-void

    .line 1128
    .end local v2    # "newValue":Ljava/lang/String;
    :cond_2
    const-string/jumbo v2, "off"

    .restart local v2    # "newValue":Ljava/lang/String;
    goto :goto_0

    .line 1130
    .end local v2    # "newValue":Ljava/lang/String;
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "newValue":Ljava/lang/String;
    goto :goto_0

    .line 1133
    .end local p1    # "value":Ljava/lang/Object;
    :cond_4
    const-string/jumbo v3, "pref_video_time_lapse_frame_interval_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1140
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1141
    .local v1, "interval":I
    invoke-static {v1}, Lcom/android/camera/statistic/CameraStatUtil;->timeLapseIntervalToName(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_1

    .line 1133
    .end local v1    # "interval":I
    :cond_5
    const-string/jumbo v3, "pref_camera_jpegquality_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1147
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 1133
    :cond_6
    const-string/jumbo v3, "pref_camera_picturesize_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1150
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 1133
    :cond_7
    const-string/jumbo v3, "pref_video_hfr_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1153
    invoke-static {p0}, Lcom/android/camera/statistic/CameraStatUtil;->addCameraSuffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 1133
    :cond_8
    const-string/jumbo v3, "pref_camera_autoexposure_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 1156
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->autoExposureToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1133
    :cond_9
    const-string/jumbo v3, "pref_qc_camera_contrast_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1159
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->contrastToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1133
    :cond_a
    const-string/jumbo v3, "pref_qc_camera_saturation_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 1162
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->saturationToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1133
    :cond_b
    const-string/jumbo v3, "pref_qc_camera_sharpness_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1165
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->sharpnessToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 1133
    :cond_c
    const-string/jumbo v3, "pref_camera_antibanding_key"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1168
    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->antiBandingToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 1142
    :catch_0
    move-exception v0

    .line 1143
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v3, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "invalid interval "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1
.end method

.method public static trackSnapInfo(Z)V
    .locals 3
    .param p0, "isVideo"    # Z

    .prologue
    .line 1117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1118
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "mode"

    if-eqz p0, :cond_0

    const-string/jumbo v1, "video"

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1119
    const-string/jumbo v1, "capture"

    const-string/jumbo v2, "snap_camera"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1120
    return-void

    .line 1118
    :cond_0
    const-string/jumbo v1, "photo"

    goto :goto_0
.end method

.method public static trackStartAppCost(J)V
    .locals 4
    .param p0, "timeInMs"    # J

    .prologue
    .line 571
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-ltz v0, :cond_0

    const-wide/16 v0, 0x2710

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    .line 572
    const-string/jumbo v0, "capture"

    .line 573
    const-string/jumbo v1, "start_app_cost"

    const/16 v2, 0x32

    invoke-static {p0, p1, v2}, Lcom/android/camera/statistic/CameraStatUtil;->round(JI)J

    move-result-wide v2

    .line 572
    invoke-static {v0, v1, v2, v3}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;J)V

    .line 577
    return-void

    .line 575
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "The time cost when start app is illegal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static trackTakePictureCost(JZI)V
    .locals 6
    .param p0, "timeInMs"    # J
    .param p2, "isFrontCamera"    # Z
    .param p3, "moduleIndex"    # I

    .prologue
    .line 555
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 556
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u524d\u540e\u6444"

    .line 557
    if-eqz p2, :cond_0

    const-string/jumbo v1, "\u524d\u6444"

    .line 556
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-static {p3}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    const-string/jumbo v1, "capture"

    .line 560
    const-string/jumbo v2, "take_picture_cost"

    const/16 v3, 0x32

    invoke-static {p0, p1, v3}, Lcom/android/camera/statistic/CameraStatUtil;->round(JI)J

    move-result-wide v4

    .line 559
    invoke-static {v1, v2, v4, v5, v0}, Lcom/android/camera/statistic/CameraStat;->recordCalculateEvent(Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V

    .line 561
    return-void

    .line 557
    :cond_0
    const-string/jumbo v1, "\u540e\u6444"

    goto :goto_0
.end method

.method public static trackTiltShiftChanged(Ljava/lang/String;)V
    .locals 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 928
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 929
    return-void

    .line 931
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 932
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 933
    .local v0, "mode":I
    const-string/jumbo v2, "\u6a21\u5f0f"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 934
    const-string/jumbo v2, "\u79fb\u8f74"

    invoke-interface {v1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 936
    const-string/jumbo v2, "counter"

    const-string/jumbo v3, "tiltshift_changed"

    .line 935
    invoke-static {v2, v3, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 937
    return-void
.end method

.method public static trackTimerChanged(Ljava/lang/String;)V
    .locals 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 914
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 915
    return-void

    .line 917
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 918
    .local v1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 919
    .local v0, "mode":I
    const-string/jumbo v2, "\u6a21\u5f0f"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    const-string/jumbo v3, "\u524d\u540e\u6444"

    .line 921
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 922
    const-string/jumbo v2, "\u524d\u6444"

    .line 920
    :goto_0
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 923
    const-string/jumbo v2, "\u5012\u8ba1\u65f6"

    invoke-interface {v1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 924
    const-string/jumbo v2, "counter"

    const-string/jumbo v3, "timer_changed"

    invoke-static {v2, v3, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 925
    return-void

    .line 922
    :cond_1
    const-string/jumbo v2, "\u540e\u6444"

    goto :goto_0
.end method

.method public static trackVideoModeChanged(Ljava/lang/String;)V
    .locals 3
    .param p0, "videoMode"    # Ljava/lang/String;

    .prologue
    .line 891
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 892
    return-void

    .line 894
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 895
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 897
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "video_mode_changed"

    .line 896
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 898
    return-void
.end method

.method public static trackVideoModeRecorded(Ljava/lang/String;IIJ)V
    .locals 3
    .param p0, "videoMode"    # Ljava/lang/String;
    .param p1, "quality"    # I
    .param p2, "hsr"    # I
    .param p3, "time"    # J

    .prologue
    .line 901
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->isCounterEventDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 902
    return-void

    .line 904
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 905
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "\u6a21\u5f0f"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    const-string/jumbo v1, "\u753b\u8d28"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->videoQualityToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 907
    const-string/jumbo v1, "\u5e27\u7387"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    const-string/jumbo v1, "\u65f6\u957f"

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 910
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "video_taken"

    .line 909
    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 911
    return-void
.end method

.method public static trackVideoRecording(ZLjava/lang/String;III)V
    .locals 5
    .param p0, "isFrontCamera"    # Z
    .param p1, "videoMode"    # Ljava/lang/String;
    .param p2, "videoQuality"    # I
    .param p3, "flashMode"    # I
    .param p4, "lapseCaptureTime"    # I

    .prologue
    .line 768
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 769
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v3, "\u524d\u540e\u6444"

    .line 770
    if-eqz p0, :cond_1

    const-string/jumbo v2, "\u524d\u6444"

    .line 769
    :goto_0
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 771
    const-string/jumbo v2, "\u6a21\u5f0f"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 772
    const-string/jumbo v2, "\u753b\u8d28"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->videoQualityToName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 773
    const-string/jumbo v3, "\u95ea\u5149\u706f"

    .line 774
    const/4 v2, 0x2

    if-ne p3, v2, :cond_2

    .line 775
    const-string/jumbo v2, "torch"

    .line 773
    :goto_1
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 776
    const-string/jumbo v2, "capture"

    const-string/jumbo v3, "video_taken"

    invoke-static {v2, v3, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 778
    if-lez p4, :cond_0

    const-string/jumbo v2, "fast"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 779
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 780
    .local v1, "params2":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u95f4\u9694"

    .line 781
    invoke-static {p4}, Lcom/android/camera/statistic/CameraStatUtil;->timeLapseIntervalToName(I)Ljava/lang/String;

    move-result-object v3

    .line 780
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 782
    const-string/jumbo v2, "capture"

    .line 783
    const-string/jumbo v3, "video_time_lapse_interval"

    .line 782
    invoke-static {v2, v3, v1}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 785
    .end local v1    # "params2":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void

    .line 770
    :cond_1
    const-string/jumbo v2, "\u540e\u6444"

    goto :goto_0

    .line 775
    :cond_2
    const-string/jumbo v2, "off"

    goto :goto_1
.end method

.method public static trackVideoSnapshot(Z)V
    .locals 3
    .param p0, "isFrontCamera"    # Z

    .prologue
    .line 749
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 750
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u524d\u540e\u6444"

    .line 751
    if-eqz p0, :cond_0

    const-string/jumbo v1, "\u524d\u6444"

    .line 750
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 752
    const-string/jumbo v1, "capture"

    const-string/jumbo v2, "video_snapshot"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 753
    return-void

    .line 751
    :cond_0
    const-string/jumbo v1, "\u540e\u6444"

    goto :goto_0
.end method

.method public static trackVoiceControl(Landroid/content/Intent;)V
    .locals 7
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1096
    if-nez p0, :cond_0

    .line 1097
    return-void

    .line 1100
    :cond_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1101
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 1103
    .local v4, "useFrontCamera":Z
    :try_start_0
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/CameraIntentManager;->isUseFrontCamera()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 1107
    .end local v4    # "useFrontCamera":Z
    :goto_0
    if-eqz v4, :cond_1

    const/4 v1, 0x1

    .line 1108
    .local v1, "facing":I
    :goto_1
    invoke-static {p0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/CameraIntentManager;->getCameraModeId()I

    move-result v3

    .line 1109
    .local v3, "moduleId":I
    const-string/jumbo v6, "\u524d\u540e\u6444"

    if-nez v1, :cond_2

    .line 1110
    const-string/jumbo v5, "\u540e\u6444"

    .line 1109
    :goto_2
    invoke-interface {v2, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    const-string/jumbo v5, "\u6a21\u5f0f"

    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    const-string/jumbo v5, "counter"

    .line 1113
    const-string/jumbo v6, "voice_assist_call_event"

    .line 1112
    invoke-static {v5, v6, v2}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 1114
    return-void

    .line 1107
    .end local v1    # "facing":I
    .end local v3    # "moduleId":I
    :cond_1
    const/4 v1, 0x0

    .restart local v1    # "facing":I
    goto :goto_1

    .line 1110
    .restart local v3    # "moduleId":I
    :cond_2
    const-string/jumbo v5, "\u524d\u6444"

    goto :goto_2

    .line 1104
    .end local v1    # "facing":I
    .end local v3    # "moduleId":I
    .restart local v4    # "useFrontCamera":Z
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public static trackZoomAdjusted(Ljava/lang/String;)V
    .locals 3
    .param p0, "mode"    # Ljava/lang/String;

    .prologue
    .line 520
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 521
    .local v0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "\u524d\u540e\u6444"

    .line 522
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 523
    const-string/jumbo v1, "\u524d\u6444"

    .line 521
    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    const-string/jumbo v1, "\u6a21\u5f0f"

    .line 525
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v2

    .line 524
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    const-string/jumbo v1, "mode"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    const-string/jumbo v1, "counter"

    const-string/jumbo v2, "zoom_adjusted"

    invoke-static {v1, v2, v0}, Lcom/android/camera/statistic/CameraStat;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 528
    return-void

    .line 523
    :cond_0
    const-string/jumbo v1, "\u540e\u6444"

    goto :goto_0
.end method

.method private static triggerModeToName(I)Ljava/lang/String;
    .locals 1
    .param p0, "mode"    # I

    .prologue
    .line 366
    sget-object v0, Lcom/android/camera/statistic/CameraStatUtil;->sTriggerModeIdToName:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private static videoQualityToName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "quality"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 207
    .local v2, "res":Landroid/content/res/Resources;
    const v4, 0x7f0b0003

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 208
    .local v3, "values":[Ljava/lang/String;
    const/4 v1, -0x1

    .line 209
    .local v1, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v3

    if-ge v0, v4, :cond_0

    .line 210
    aget-object v4, v3, v0

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 211
    move v1, v0

    .line 215
    :cond_0
    packed-switch v1, :pswitch_data_0

    .line 225
    sget-object v4, Lcom/android/camera/statistic/CameraStatUtil;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "unexpected video quality: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    const-string/jumbo v4, "others"

    return-object v4

    .line 209
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 217
    :pswitch_0
    const-string/jumbo v4, "4k"

    return-object v4

    .line 219
    :pswitch_1
    const-string/jumbo v4, "1080p"

    return-object v4

    .line 221
    :pswitch_2
    const-string/jumbo v4, "720p"

    return-object v4

    .line 223
    :pswitch_3
    const-string/jumbo v4, "480p"

    return-object v4

    .line 215
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static zoomRatioToName(F)Ljava/lang/String;
    .locals 1
    .param p0, "zoomRatio"    # F

    .prologue
    .line 390
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, v0, p0

    if-nez v0, :cond_0

    .line 391
    const-string/jumbo v0, "1x"

    return-object v0

    .line 392
    :cond_0
    const/high16 v0, 0x40000000    # 2.0f

    cmpl-float v0, v0, p0

    if-nez v0, :cond_1

    .line 393
    const-string/jumbo v0, "2x"

    return-object v0

    .line 395
    :cond_1
    const-string/jumbo v0, "others"

    return-object v0
.end method
