.class public Lcom/android/camera/constant/UpdateConstant;
.super Ljava/lang/Object;
.source "UpdateConstant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/UpdateConstant$UpdateType;
    }
.end annotation


# static fields
.field public static final AI_SCENE_CONFIG:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final CAMERA_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final CAMERA_TYPES_MANUALLY:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final CAMERA_TYPES_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final FUN_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final FUN_TYPES_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final PANORAMA_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final PANORAMA_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final VIDEO_TYPES_INIT:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field

.field public static final VIDEO_TYPES_RECORD:[I
    .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v5, 0x1d

    const/4 v4, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x1

    .line 223
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_INIT:[I

    .line 236
    const/16 v0, 0x12

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_ON_PREVIEW_SUCCESS:[I

    .line 260
    const/16 v0, 0x10

    .line 261
    const/16 v1, 0xf

    .line 258
    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_MANUALLY:[I

    .line 268
    filled-new-array {v3, v5}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_INIT:[I

    .line 277
    new-array v0, v2, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_ON_PREVIEW_SUCCESS:[I

    .line 291
    const/16 v0, 0x13

    .line 292
    const/16 v1, 0x1f

    .line 293
    const/16 v2, 0x21

    .line 290
    filled-new-array {v0, v1, v2}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->VIDEO_TYPES_RECORD:[I

    .line 302
    const/4 v0, 0x2

    .line 300
    filled-new-array {v3, v0, v5}, [I

    move-result-object v0

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_INIT:[I

    .line 310
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->FUN_TYPES_ON_PREVIEW_SUCCESS:[I

    .line 324
    new-array v0, v3, [I

    .line 325
    aput v3, v0, v4

    .line 324
    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_TYPES_INIT:[I

    .line 332
    new-array v0, v3, [I

    .line 333
    const/16 v1, 0x20

    aput v1, v0, v4

    .line 332
    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_ON_PREVIEW_SUCCESS:[I

    .line 337
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/android/camera/constant/UpdateConstant;->AI_SCENE_CONFIG:[I

    .line 9
    return-void

    .line 223
    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x1a
        0x1b
        0x1c
        0x1d
    .end array-data

    .line 236
    :array_1
    .array-data 4
        0x7
        0x8
        0xa
        0xb
        0xe
        0x13
        0x4
        0xd
        0x5
        0x9
        0x14
        0x15
        0x16
        0x22
        0x17
        0x19
        0x24
        0x25
    .end array-data

    .line 277
    :array_2
    .array-data 4
        0x5
        0x9
        0xa
        0xe
        0x19
        0x1f
    .end array-data

    .line 310
    :array_3
    .array-data 4
        0x5
        0x9
        0xa
        0xe
        0x19
        0x1f
        0x13
    .end array-data

    .line 337
    :array_4
    .array-data 4
        0xd
        0xb
        0x1c
        0x22
        0x1b
        0x14
        0x1a
        0x1e
        0x10
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
